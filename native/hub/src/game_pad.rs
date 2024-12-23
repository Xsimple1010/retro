use crate::messages::{
    game_pad_button_pressed::GamePadButtonPressedOutput,
    game_pad_connected::GamePadConnectedOutput,
    game_pad_list::{self, GamePadConnectedListOutput},
    GamePadConnectedListInput,
};
use std::sync::{Arc, Mutex};
use tinic::{
    Device,
    DeviceState::{self, ButtonPressed, Connected, Disconnected},
    GamepadKeyMap, Tinic,
};

pub fn device_state_listener(state: DeviceState, device: Device) {
    println!("{:?}", device);
    match state {
        ButtonPressed(button) => {
            GamePadButtonPressedOutput { name: button }.send_signal_to_dart();
        }
        Connected | Disconnected => {
            GamePadConnectedOutput {
                name: device.name.to_string(),
                port: device.retro_port as i32,
            }
            .send_signal_to_dart();
        }
    }
}

pub async fn get_game_pad_list(tinic: Arc<Mutex<Tinic>>) {
    let receiver = GamePadConnectedListInput::get_dart_signal_receiver();

    while let Some(_) = receiver.recv().await {
        seed_game_pad_list(&tinic);
    }
}

fn seed_game_pad_list(tinic: &Arc<Mutex<Tinic>>) {
    if let Ok(tinic) = &mut tinic.try_lock() {
        let mut current_list: Vec<game_pad_list::GamePadItem> = Vec::new();

        if let Ok(controller) = &mut tinic.controller.lock() {
            for game_pad in controller.get_list() {
                let mut key_map: Vec<game_pad_list::KeyMap> = Vec::new();

                for key in game_pad.key_map {
                    key_map.push(game_pad_list::KeyMap {
                        native: key.native as i32,
                        native_name: GamepadKeyMap::get_key_name_from_native_button(&key.native)
                            .to_owned(),
                        retro: key.retro as i32,
                        native_retro: GamepadKeyMap::get_key_name_from_retro_button(key.retro)
                            .to_owned(),
                        pressed: key.pressed,
                    });
                }

                current_list.push(game_pad_list::GamePadItem {
                    name: game_pad.name,
                    port: game_pad.retro_port as i32,
                    key_map: key_map,
                })
            }
        }

        GamePadConnectedListOutput {
            game_pad_items: current_list,
        }
        .send_signal_to_dart();
    }
}

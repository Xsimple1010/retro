use once_cell::sync::Lazy;
use std::sync::Mutex;
use tinic::{GamePadState, RetroGamePad, Tinic};

use crate::messages::{
    game_pad_connected::{
        self, GamePadConnectedListInput, GamePadConnectedListOutput, GamePadConnectedOutput,
    },
    load_core::LoadCoreInput,
    load_rom::LoadRomInput,
    pause::PauseInput,
    resume::ResumeInput,
};

fn gamepad_listener(state: GamePadState, gamepad: RetroGamePad) {
    let mut key_map: Vec<game_pad_connected::KeyMap> = Vec::new();

    for key in gamepad.key_map {
        key_map.push(game_pad_connected::KeyMap {
            native: key.native as i32,
            retro: key.retro as i32,
            pressed: key.pressed,
        });
    }

    GamePadConnectedOutput {
        name: gamepad.name.to_string(),
        port: gamepad.retro_port as i32,
        key_map: key_map,
    }
    .send_signal_to_dart(None);
}

static TINIC: Lazy<Mutex<Tinic>> = Lazy::new(|| Mutex::new(Tinic::new(Some(gamepad_listener))));

pub fn init() {
    match &mut TINIC.lock() {
        Ok(..) => {}
        _ => {}
    }
}

pub async fn load_core() {
    let mut receiver = LoadCoreInput::get_dart_signal_receiver();

    while let Some(dart_signal) = receiver.recv().await {
        if let Ok(tinic) = &mut TINIC.lock() {
            if let Some(paths) = dart_signal.message.paths {
                let _ = tinic.load_core(
                    &dart_signal.message.path.to_string(),
                    tinic::Paths {
                        system: paths.system,
                        save: paths.save,
                        opt: paths.opt,
                    },
                );
            }
        }
    }
}

pub async fn load_rom() {
    let mut receiver = LoadRomInput::get_dart_signal_receiver();

    while let Some(dart_signal) = receiver.recv().await {
        if let Ok(tinic) = &mut TINIC.lock() {
            let _ = tinic.load_rom(dart_signal.message.path);
        }
    }
}

pub async fn pause() {
    let mut receiver = PauseInput::get_dart_signal_receiver();

    while let Some(_) = receiver.recv().await {
        if let Ok(tinic) = &mut TINIC.lock() {
            let _ = tinic.pause();
        }
    }
}

pub async fn resume() {
    let mut receiver = ResumeInput::get_dart_signal_receiver();

    while let Some(_) = receiver.recv().await {
        if let Ok(tinic) = &mut TINIC.lock() {
            let _ = tinic.resume();
        }
    }
}

pub async fn get_gamepad_list() {
    let mut receiver = GamePadConnectedListInput::get_dart_signal_receiver();

    while let Some(_) = receiver.recv().await {
        if let Ok(tinic) = &mut TINIC.lock() {
            let mut current_list: Vec<game_pad_connected::GamePadItem> = Vec::new();

            if let Ok(list) = &mut tinic.controller_ctx.get_list().lock() {
                for gamepad in list.to_vec() {
                    let mut key_map: Vec<game_pad_connected::KeyMap> = Vec::new();

                    for key in gamepad.key_map {
                        key_map.push(game_pad_connected::KeyMap {
                            native: key.native as i32,
                            retro: key.retro as i32,
                            pressed: key.pressed,
                        });
                    }

                    current_list.push(game_pad_connected::GamePadItem {
                        name: gamepad.name,
                        port: gamepad.retro_port as i32,
                        key_map: key_map,
                    })
                }
            }

            GamePadConnectedListOutput {
                game_pad_items: current_list,
            }
            .send_signal_to_dart(None);
        }
    }
}

use crate::messages::{load_rom::LoadRomInput, PauseInput, ResumeInput};
use std::sync::{Arc, Mutex};
use tinic::{RetroPaths, Tinic};

pub async fn load_rom(tinic: Arc<Mutex<Tinic>>) {
    let receiver = LoadRomInput::get_dart_signal_receiver();

    while let Some(dart_signal) = receiver.recv().await {
        if let Ok(tinic) = &mut tinic.lock() {
            if let Some(paths) = dart_signal.message.paths {
                let _ = tinic.load_game(
                    &dart_signal.message.core_path,
                    &dart_signal.message.rom_path,
                    RetroPaths::new(paths.system, paths.save, paths.opt, paths.assets).unwrap(),
                );
            }
        }
    }
}

pub async fn pause(tinic: Arc<Mutex<Tinic>>) {
    let receiver = PauseInput::get_dart_signal_receiver();

    while let Some(_) = receiver.recv().await {
        if let Ok(tinic) = &tinic.lock() {
            let _ = tinic.pause();
        }
    }
}

pub async fn resume(tinic: Arc<Mutex<Tinic>>) {
    let receiver = ResumeInput::get_dart_signal_receiver();

    while let Some(_) = receiver.recv().await {
        if let Ok(tinic) = &mut tinic.lock() {
            let _ = tinic.resume();
        }
    }
}

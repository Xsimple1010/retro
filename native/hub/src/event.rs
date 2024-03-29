use once_cell::sync::Lazy;
use std::sync::Mutex;
use tinic::Tinic;

use crate::messages::{
    load_core::LoadCoreInput, load_rom::LoadRomInput, pause::PauseInput, resume::ResumeInput,
};

static TINIC: Lazy<Mutex<Tinic>> = Lazy::new(|| Mutex::new(Tinic::new(None)));

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
pub async fn get_gamepad_list() {}

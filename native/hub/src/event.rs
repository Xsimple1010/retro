use crate::messages::{load_rom::LoadRomInput, pause::PauseInput, resume::ResumeInput};
use std::sync::{Arc, Mutex};
use tinic::Tinic;

pub async fn load_rom(tinic: Arc<Mutex<Tinic>>) {
    let mut receiver = LoadRomInput::get_dart_signal_receiver().unwrap();

    while let Some(dart_signal) = receiver.recv().await {
        if let Ok(tinic) = &mut tinic.lock() {
            if let Some(paths) = dart_signal.message.paths {
                let _ = tinic.load_core(
                    dart_signal.message.core_path.to_string(),
                    dart_signal.message.rom_path.to_string(),
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

// pub async fn load_rom(tinic: Arc<Mutex<Tinic>>) {
//     let mut receiver = LoadRomInput::get_dart_signal_receiver();

//     while let Some(dart_signal) = receiver.recv().await {
//         if let Ok(tinic) = &mut tinic.lock() {
//             let _ = tinic.load_rom(dart_signal.message.path);
//         }
//     }
// }

pub async fn pause(tinic: Arc<Mutex<Tinic>>) {
    let mut receiver = PauseInput::get_dart_signal_receiver().unwrap();

    while let Some(_) = receiver.recv().await {
        if let Ok(tinic) = &mut tinic.lock() {
            let _ = tinic.pause();
        }
    }
}

pub async fn resume(tinic: Arc<Mutex<Tinic>>) {
    let mut receiver = ResumeInput::get_dart_signal_receiver().unwrap();

    while let Some(_) = receiver.recv().await {
        if let Ok(tinic) = &mut tinic.lock() {
            let _ = tinic.resume();
        }
    }
}

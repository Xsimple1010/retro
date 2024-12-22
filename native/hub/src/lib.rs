use std::sync::{Arc, Mutex};
use tinic::Tinic;

mod event;
mod game_pad;
mod messages;
use game_pad::device_state_listener;

// Uncomment below to target the web.
// use tokio_with_wasm::alias as tokio;

rinf::write_interface!();

async fn main() {
    let tinic = Arc::new(Mutex::new(Tinic::new(Some(device_state_listener)).unwrap()));

    tokio::spawn(event::load_rom(tinic.clone()));
    tokio::spawn(event::pause(tinic.clone()));
    tokio::spawn(event::resume(tinic.clone()));

    tokio::spawn(game_pad::get_game_pad_list(tinic.clone()));
}

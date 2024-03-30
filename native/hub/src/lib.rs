//! This `hub` crate is the
//! entry point of the Rust logic.
extern crate once_cell;
extern crate tinic;
use std::sync::{Arc, Mutex};

use tinic::Tinic;
use tokio_with_wasm::tokio;

mod event;
mod game_pad;
mod messages;

rinf::write_interface!();

async fn main() {
    let tinic = Arc::new(Mutex::new(Tinic::new(Some(game_pad::game_pad_listener))));

    tokio::spawn(event::load_core(tinic.clone()));
    tokio::spawn(event::load_rom(tinic.clone()));
    tokio::spawn(event::pause(tinic.clone()));
    tokio::spawn(event::resume(tinic.clone()));

    tokio::spawn(game_pad::get_game_pad_list(tinic.clone()));
}

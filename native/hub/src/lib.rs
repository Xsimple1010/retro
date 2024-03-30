//! This `hub` crate is the
//! entry point of the Rust logic.
extern crate once_cell;
extern crate tinic;
// This `tokio` will be used by Rinf.
// You can replace it with the original `tokio`
// if you're not targeting the web.
use tokio_with_wasm::tokio;

mod event;
mod messages;
// mod sample_functions;

rinf::write_interface!();

// Always use non-blocking async functions
// such as `tokio::fs::File::open`.
// If you really need to use blocking code,
// use `tokio::task::spawn_blocking`.
async fn main() {
    // Repeat `tokio::spawn` anywhere in your code
    // if more concurrent tasks are needed.
    event::init();

    tokio::spawn(event::load_core());
    tokio::spawn(event::load_rom());
    tokio::spawn(event::pause());
    tokio::spawn(event::resume());
    tokio::spawn(event::get_gamepad_list());
    // tokio::spawn(sample_functions::run_debug_tests());
}

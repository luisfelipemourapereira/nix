#! /usr/bin/env nix-shell
//! ```cargo
//! [dependencies]
//! toml = "0.7.1"
//! ```
/*
#!nix-shell -i rust-script -p rustc -p rust-script -p cargo
*/

use std::fs::File;
use std::io::prelude::*;
use toml::from_str;

#[derive(Debug, Deserialize)]
struct Config {
    repos: HashMap<String>;
}

fn main() {
    let config_file: &str = "repos.toml";
    let mut file = File::open(config_file).unwrap();
    let mut contents = String::new();
    file.read_to_string(&mut contents).unwrap();
    let config: Config = from_str(&contents).unwrap();
    println!("{:?}", config)
}

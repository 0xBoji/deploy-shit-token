// Copyright (c) The Weminal Labs
// SPDX-License-Identifier: Apache-2.0

/// @title SHIT Token Contract
/// @dev A token contract that manages the SHIT token.
module token::Shit {
    use aptos_framework::coin::{create_currency, Coin, TreasuryCap};
    use aptos_framework::vector;

    // === Constants ===
    const INITIAL_SUPPLY: u64 = 2920000000000;

    // === Structs ===
    public struct SHITToken has drop {
        name: vector<u8>,
        symbol: vector<u8>,
        total_supply: u64,
        owner: address,
    }

    // === Public Functions ===
    public entry fun init(owner: address): Coin<SHITToken> {
        let token = SHITToken {
            name: b"SHIT".to_vec(),
            symbol: b"SHIT".to_vec(),
            total_supply: INITIAL_SUPPLY,
            owner,
        };

        // create the currency and mint initial supply to the owner
        let (treasury, metadata) = create_currency(
            token,
            4, // decimals
            b"SHIT", // symbol
            b"SHIT", // name
            b"Shut up and take my shit", // description
            option::none, // icon_url
            ctx,
        );

        transfer::public_freeze_object(metadata);
        treasury.mint(INITIAL_SUPPLY, owner);
        return treasury;
    }

    #[view]
    public fun get_total_supply(token: &SHITToken): u64 {
        token.total_supply
    }
}
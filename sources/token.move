module token::Shit {
    use aptos_framework::coin;
    use aptos_framework::vector;

    struct SHITToken {
        name: vector<u8>,
        symbol: vector<u8>,
        total_supply: u64,
        owner: address,
    }

    public fun initialize(owner: address) {
        let token = SHITToken {
            name: b"SHIT".to_vec(),
            symbol: b"SHIT".to_vec(),
            total_supply: 2920000000000,
            owner,
        };

        // mint initial supply to the owner
        coin::mint(owner, token.total_supply);
    }

    public fun get_total_supply(token: &SHITToken): u64 {
        token.total_supply
    }
}
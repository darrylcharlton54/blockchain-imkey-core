pub mod error;
pub mod transaction;
pub mod tx_signer;
pub mod usdt_transaction;

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}

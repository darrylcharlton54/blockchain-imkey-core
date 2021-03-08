#[derive(Clone, PartialEq, ::prost::Message)]
pub struct Utxo {
    #[prost(string, tag = "1")]
    pub tx_hash: std::string::String,
    #[prost(int32, tag = "2")]
    pub vout: i32,
    #[prost(int64, tag = "3")]
    pub amount: i64,
    #[prost(string, tag = "4")]
    pub address: std::string::String,
    #[prost(string, tag = "5")]
    pub script_pub_key: std::string::String,
    #[prost(string, tag = "6")]
    pub derived_path: std::string::String,
    #[prost(int64, tag = "7")]
    pub sequence: i64,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct BchTxInput {
    #[prost(string, tag = "1")]
    pub to: std::string::String,
    #[prost(int64, tag = "2")]
    pub amount: i64,
    #[prost(message, repeated, tag = "3")]
    pub unspents: ::std::vec::Vec<Utxo>,
    #[prost(int64, tag = "4")]
    pub fee: i64,
    #[prost(string, tag = "5")]
    pub change_address: std::string::String,
    #[prost(string, tag = "6")]
    pub network: std::string::String,
    #[prost(string, tag = "7")]
    pub op_return: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct BchTxOutput {
    #[prost(string, tag = "1")]
    pub signature: std::string::String,
    #[prost(string, tag = "2")]
    pub tx_hash: std::string::String,
}

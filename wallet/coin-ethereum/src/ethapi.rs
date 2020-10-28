#[derive(Clone, PartialEq, ::prost::Message)]
pub struct EthTxInput {
    #[prost(string, tag = "1")]
    pub nonce: std::string::String,
    #[prost(string, tag = "2")]
    pub gas_price: std::string::String,
    #[prost(string, tag = "3")]
    pub gas_limit: std::string::String,
    #[prost(string, tag = "4")]
    pub to: std::string::String,
    #[prost(string, tag = "5")]
    pub value: std::string::String,
    #[prost(string, tag = "6")]
    pub data: std::string::String,
    #[prost(string, tag = "7")]
    pub chain_id: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct EthTxOutput {
    #[prost(string, tag = "1")]
    pub tx_data: std::string::String,
    #[prost(string, tag = "2")]
    pub tx_hash: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct EthMessageSignParam {
    #[prost(string, tag = "1")]
    pub path: std::string::String,
    #[prost(string, tag = "2")]
    pub message: std::string::String,
    #[prost(string, tag = "3")]
    pub sender: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct EthMessageSignResult {
    #[prost(string, tag = "1")]
    pub signature: std::string::String,
}

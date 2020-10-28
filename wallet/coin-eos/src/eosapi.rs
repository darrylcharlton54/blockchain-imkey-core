#[derive(Clone, PartialEq, ::prost::Message)]
pub struct EosTxInput {
    #[prost(message, repeated, tag = "1")]
    pub sign_datas: ::std::vec::Vec<EosSignData>,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct EosSignData {
    #[prost(string, tag = "1")]
    pub tx_data: std::string::String,
    #[prost(string, repeated, tag = "2")]
    pub pub_keys: ::std::vec::Vec<std::string::String>,
    #[prost(string, tag = "3")]
    pub chain_id: std::string::String,
    #[prost(string, tag = "4")]
    pub receiver: std::string::String,
    #[prost(string, tag = "5")]
    pub payment: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct EosTxOutput {
    #[prost(message, repeated, tag = "1")]
    pub trans_multi_signs: ::std::vec::Vec<EosSignResult>,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct EosSignResult {
    #[prost(string, tag = "1")]
    pub hash: std::string::String,
    #[prost(string, repeated, tag = "2")]
    pub signs: ::std::vec::Vec<std::string::String>,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct EosMessageSignParam {
    #[prost(string, tag = "1")]
    pub path: std::string::String,
    #[prost(string, tag = "2")]
    pub data: std::string::String,
    #[prost(bool, tag = "3")]
    pub is_hex: bool,
    #[prost(string, tag = "4")]
    pub pubkey: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct EosMessageSignResult {
    #[prost(string, tag = "1")]
    pub signature: std::string::String,
}

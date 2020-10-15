#[derive(Clone, PartialEq, ::prost::Message)]
pub struct FilecoinTxReq {
    #[prost(message, optional, tag = "1")]
    pub message: ::std::option::Option<UnsignedMessage>,
    #[prost(string, tag = "2")]
    pub path: std::string::String,
    #[prost(string, tag = "3")]
    pub network: std::string::String,
    #[prost(string, tag = "4")]
    pub payment_dis: std::string::String,
    #[prost(string, tag = "5")]
    pub to_dis: std::string::String,
    #[prost(string, tag = "6")]
    pub from_dis: std::string::String,
    #[prost(string, tag = "7")]
    pub fee_dis: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct UnsignedMessage {
    #[prost(string, tag = "1")]
    pub to: std::string::String,
    #[prost(string, tag = "2")]
    pub from: std::string::String,
    #[prost(uint64, tag = "3")]
    pub nonce: u64,
    #[prost(string, tag = "4")]
    pub value: std::string::String,
    #[prost(int64, tag = "5")]
    pub gas_limit: i64,
    #[prost(string, tag = "6")]
    pub gas_fee_cap: std::string::String,
    #[prost(string, tag = "7")]
    pub gas_premium: std::string::String,
    #[prost(uint64, tag = "8")]
    pub method: u64,
    #[prost(string, tag = "9")]
    pub params: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct FilecoinTxRes {
    #[prost(string, tag = "1")]
    pub cid: std::string::String,
    #[prost(message, optional, tag = "2")]
    pub message: ::std::option::Option<UnsignedMessage>,
    #[prost(message, optional, tag = "3")]
    pub signature: ::std::option::Option<Signature>,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct Signature {
    #[prost(uint32, tag = "1")]
    pub r#type: u32,
    #[prost(string, tag = "2")]
    pub data: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct FilecoinAddressReq {
    #[prost(string, tag = "1")]
    pub network: std::string::String,
    #[prost(string, tag = "2")]
    pub path: std::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct FilecoinAddressRes {
    #[prost(string, tag = "1")]
    pub address: std::string::String,
}

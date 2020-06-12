package com.mk.imkeylibrary.keycore;

import android.text.TextUtils;

import com.google.protobuf.InvalidProtocolBufferException;
import com.mk.imkeylibrary.exception.ImkeyException;
import com.mk.imkeylibrary.utils.ByteUtil;
import com.mk.imkeylibrary.utils.NumericUtil;

public class Api {
    public static byte[] callApi(String paramHex) {
        RustApi.INSTANCE.clear_err();
        String res = RustApi.INSTANCE.call_imkey_api(paramHex);
        String error = RustApi.INSTANCE.get_last_err_message();
        if(!TextUtils.isEmpty(error)){
            api.Api.Response response = null;
            try {
                response = api.Api.Response.parseFrom(ByteUtil.hexStringToByteArray(error));
            } catch (InvalidProtocolBufferException e) {
                e.printStackTrace();
                throw new ImkeyException(e.getMessage());
            }
            if(!response.getIsSuccess()){
                throw new ImkeyException(response.getError());
            }
        }

        return NumericUtil.hexToBytes(res);
    }
}

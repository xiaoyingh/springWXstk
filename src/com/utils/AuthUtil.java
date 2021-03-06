package com.utils;

import java.io.IOException;
import net.sf.json.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

public class AuthUtil
{
  public static final String APPID = "wx1d42fa2fba520d22";
  public static final String APPSECRET = "caf5381cc5b63cb108c0fece2324834c";
  
  public static JSONObject doGetJson(String url)
    throws ClientProtocolException, IOException
  {
    JSONObject jsonObject = null;
    DefaultHttpClient client = new DefaultHttpClient();
    HttpGet httpGet = new HttpGet(url);
    HttpResponse response = client.execute(httpGet);
    HttpEntity entity = response.getEntity();
    if (entity != null)
    {
      String result = EntityUtils.toString(entity, "utf-8");
      jsonObject = JSONObject.fromObject(result);
    }
    httpGet.releaseConnection();
    return jsonObject;
  }
}

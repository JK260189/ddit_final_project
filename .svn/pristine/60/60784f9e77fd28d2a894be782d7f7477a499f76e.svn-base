package kr.or.ddit.ui;

import java.net.URI;

import org.java_websocket.client.WebSocketClient;
import org.java_websocket.drafts.Draft;
import org.java_websocket.handshake.ServerHandshake;
import org.json.JSONObject;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketUtil extends WebSocketClient {

	private JSONObject obj;

	public WebSocketUtil(URI serverUri, Draft protocolDraft) {
		super(serverUri, protocolDraft);
	}

	@Override
	public void onMessage(String message) {

		obj = new JSONObject(message);

	}

	@Override
	public void onOpen(ServerHandshake handshake) {
		System.out.println(handshake);
		System.out.println("opened connection");
	}

	@Override
	public void onClose(int code, String reason, boolean remote) {
		System.out.println(code);
		System.out.println(reason);
		System.out.println(remote);

		System.out.println("closed connection");
	}

	@Override
	public void onError(Exception ex) {
		log.info("ex = {}", ex);
		ex.printStackTrace();
	}

	public JSONObject getResult() {
		return this.obj;
	}

}
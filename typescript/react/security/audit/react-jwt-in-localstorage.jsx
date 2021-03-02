import jwt_decode from "jwt-decode";
import { something } from "foobar";

export const testAuth1 = async () => {
  const { token } = await retrieveToken();
// ruleid: react-jwt-in-localstorage
  const decoded = jwt_decode(token);
  localStorage.setItem(TOKEN_PARAM, token);
};

export const testAuth2 = async () => {
  const { token } = await retrieveToken();
// ruleid: react-jwt-in-localstorage
  const decoded = jwt_decode(token);
  localStorage.setItem(EXPIRES_TOKEN, JSON.stringify(decoded.exp * 1000));
};

export const okTestAuth1 = async () => {
  const { token } = await retrieveToken();
// ok: react-jwt-in-localstorage
  const decoded = jwt_decode(token);
  something(EXPIRES_TOKEN, JSON.stringify(decoded.exp * 1000));
};

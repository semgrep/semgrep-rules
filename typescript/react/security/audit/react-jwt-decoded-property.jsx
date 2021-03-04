import jwt_decode from "jwt-decode";
import { something } from "foobar";

export const testAuth1 = async () => {
  const { token } = await retrieveToken();
  const decoded = jwt_decode(token);
// ruleid: react-jwt-decoded-property
  const exp = decoded.exp * 1000;
  return exp;
};

export const okTestAuth1 = async () => {
  const { token } = await retrieveToken();
// ok: react-jwt-decoded-property
  const decoded = jwt_decode(token);
  foobar(decoded);
};

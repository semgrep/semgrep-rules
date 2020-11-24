import jwt_decode from "jwt-decode";
import { something } from "foobar";

export const testAuth1 = async (): Promise<void> => {
  const { token } = await retrieveToken();
  const decoded = jwt_decode<any>(token);
// ruleid: react-jwt-decoded-property
  const exp = decoded.exp * 1000;
  return exp;
};

export const okTestAuth1 = async (): Promise<void> => {
  const { token } = await retrieveToken();
// ok: react-jwt-decoded-property
  const decoded = jwt_decode<any>(token);
  foobar(decoded);
};

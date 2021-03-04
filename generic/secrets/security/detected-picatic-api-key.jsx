import React, { PureComponent } from 'react'
import DialogTextInput from '../components/DialogTextInput'
class Login extends PureComponent {
  render() {
    const { user, fetchUser } = this.props
    return (
      <DialogTextInput
        open
        title="Enter Picatic API Key"
        value={
          // ruleid: detected-picatic-api-key
          user.apiKey ? user.apiKey : 'sk_live_a6afaeada6a1a8a3a6a5a1a2aca1aea7'
        }
        errorMessage={user.errorMessage}
        // ruleid: detected-picatic-api-key
        placeholder="sk_live_a6afaeada6a1a8a3a6a5a1a2aca1aea7"
        handleClick={fetchUser}
        buttonText="Login"
        required
      />
    )
  }
}
export default Login

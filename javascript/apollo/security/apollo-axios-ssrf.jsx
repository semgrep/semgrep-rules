module.exports = {
    Query: {
        requestStatus(parent, args, context, info)
        {
            url = args.url
            const axios = require('axios');

            axios({
                method: 'GET'
            })
            console.log(url)
            async function getStatus(url) {
                try {
                  // ruleid: apollo-axios-ssrf
                  const response = await axios.request(url);
                  console.log(response);
                  var s = response.status;
                } catch (error) {
                  console.error(error);
                  var s = error.code;
                }
                return s;
              }
            return getStatus(url);

        },

        requestResponse(parent, args, context, info)
        {
            url = args.url
            verb = args.verb
            payload = args.payload
            const axios = require('axios');
            if (payload !== null || payload !== "") {
                axios({
                    method: verb,
                    data: payload,
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
            }
            else {
                axios({
                    method: verb
                })
            }

            console.log(url)
            console.log(payload)

            async function getResponse(url) {
                try {
                    // ruleid: apollo-axios-ssrf
                    const response = await axios.request(url);
                    console.log(response);
                    var s = response.status;
                } catch (error) {
                    console.error(error);
                    var s = error.message;
                }
                return s;
            }


            async function getResponseWithPayload(url, payload) {
                try {
                  // ruleid: apollo-axios-ssrf
                  const response = await axios.request(url);
                  console.log(response);
                  var s = response.status;
                } catch (error) {
                  console.error(error);
                  var s = error.message;
                }
                return s;
            }

            if (payload !== null || payload !== "") {
                return getResponse(url);
            }
            else {
                return getResponseWithPayload(url, payload)
            }

        }

      }
  };

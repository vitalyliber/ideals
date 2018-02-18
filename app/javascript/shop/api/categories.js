import superagent from 'superagent'
import CSRF from 'superagent-csrf'
const superagent_csrf = CSRF(superagent)
import csrf_token from './csrf_token'

const API_ENDPOINT = '/categories'

const fetchCategories = () => {
  return superagent_csrf
    .get(API_ENDPOINT)
    .csrf(csrf_token)
    .set('Accept', 'application/json')
    .send()
}

export default { fetchCategories }
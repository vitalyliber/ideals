import superagent from 'superagent'
import CSRF from 'superagent-csrf'
const superagent_csrf = CSRF(superagent)
import csrf_token from './csrf_token'

const API_ENDPOINT = ( category_id ) => `/categories/${category_id}/products`

const fetchProducts = ( category_id) => {
  return superagent_csrf
    .get(API_ENDPOINT(category_id))
    .csrf(csrf_token)
    .set('Accept', 'application/json')
    .send( category_id )
}

export default { fetchProducts }
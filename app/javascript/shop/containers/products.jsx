import React, {Component, Fragment} from "react"
import Products from "../api/products"
import Loader from "../components/loader"
import Error from "../components/error"



export default class ProductsComponent extends Component {
  constructor(props) {
    super(props)

    this.state = {
      isFetching: true,
      products: [],
      errors: [],
      error_code: null,
    }
  }

  componentWillMount() {
    const { match: { params: { category_id } } } = this.props

    Products.fetchProducts(category_id)
      .then(res =>
        this.setState({
          products: res.body,
          isFetching: false,
        })
      )
      .catch(err =>
        this.setState({
          isFetching: false,
          errors: err.response.body.errors,
          error_code: err.response.status,
        })
      )
  }

  render() {
    const { isFetching, products, errors, error_code } = this.state
    const { location: { pathname } } = this.props


    if (errors[0]) {
      return <Error errors={ errors } error_code={error_code} pathname={pathname}/>
    }

    return (
      <div>
        <h2>Products</h2>

        { isFetching ? (
          <Loader/>
        ) : (
          <Fragment>
            { products.map( el =>
              <div key={ el.id }>{ `${el.name} - ${el.price}` }</div>
            )}
          </Fragment>
        )}
      </div>
    )
  }
}

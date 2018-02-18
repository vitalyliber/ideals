import React, {Component, Fragment} from "react"
import Categories from "../api/categories"
import Error from "../components/error"
import Loader from "../components/loader"
import { Link } from 'react-router-dom'


export default class CategoriesComponent extends Component {
  constructor(props) {
    super(props)

    this.state = {
      isFetching: true,
      categories: [],
      errors: [],
      error_code: null,
    }
  }

  componentWillMount() {
    Categories.fetchCategories()
      .then(res =>
        this.setState({
          categories: res.body,
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
    const { isFetching, categories, errors, error_code } = this.state
    const { location: { pathname } } = this.props

    if (errors[0]) {
      return <Error errors={ errors } error_code={error_code} pathname={pathname}/>
    }

    return (
      <div>
        <h2>Categories</h2>

        { isFetching ? (
          <Loader/>
        ) : (
          <Fragment>
            { categories.map( el =>
              <div key={ el.id }>
                <Link to={`web/categories/${el.id}/products`}>{ el.name }</Link>
              </div>
            )}
          </Fragment>
        )}
      </div>
    )
  }
}

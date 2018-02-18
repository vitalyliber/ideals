import React from 'react'
import ReactDOM from 'react-dom'
import {
  BrowserRouter as Router,
  Route,
  Link,
  Switch,
} from 'react-router-dom'

import Categories from './containers/categories'
import Products from './containers/products'
import NotMatch from './containers/not_match'

ReactDOM.render(
  <Router>
    <div>
      <h2><Link to="/">iDeals</Link></h2>

      <hr/>

      <Switch>
        <Route exact path="/" component={Categories}/>
        <Route path="/web/categories/:category_id/products" component={Products}/>
        <Route component={NotMatch} />
      </Switch>
    </div>
  </Router>,
  document.body.appendChild(document.createElement('div')),
)

import React from 'react';
import { BrowserRouter as Router, Route, Switch} from 'react-router-dom';

import Home from '../components/Home'
import Subscribed from '../components/Subscribed'
import Verified from '../components/Verified'
import Unsubscribed from '../components/Unsubscribed'

export default (
    <Router>
        <Switch>
            <Route path="/" exact component={Home} />
            <Route path="/subscribed" exact component={Subscribed} />
            <Route path="/verified" exact component={Verified} />
            <Route path="/unsubscribed" exact component={Unsubscribed} />
        </Switch>
    </Router>
)
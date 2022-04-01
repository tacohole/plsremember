import React from 'react';
import { BrowserRouter as Router, Routes, Route} from 'react-router-dom';

import Home from '../components/Home'
import Subscribed from '../components/Subscribed'
import Verified from '../components/Verified'
import Unsubscribed from '../components/Unsubscribed'

export default (
    <Router>
        <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/subscribed" element={<Subscribed />} />
            <Route path="/verified" element={<Verified />} />
            <Route path="/unsubscribed" element={<Unsubscribed />} />
        </Routes>     
    </Router>
)
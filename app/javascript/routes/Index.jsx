import React from 'react';
import { BrowserRouter as Router, Routes, Route} from 'react-router-dom';

import Home from '../components/Home'
import About from '../components/about/About'
import Subscribed from '../components/Subscribed'
import Verified from '../components/Verified'
import Unsubscribed from '../components/Unsubscribed'
import Header from '../components/header/Header';

export default (
    <Router>
      <Header />
        <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/about" element={<About />} />
            <Route path="/subscribed" element={<Subscribed />} />
            <Route path="/verified" element={<Verified />} />
            <Route path="/unsubscribed" element={<Unsubscribed />} />
        </Routes>     
    </Router>
)
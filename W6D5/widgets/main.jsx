import React from 'react';
import Clock from './frontend/clock';
import Weather from './frontend/weather';
import AutoComplete from './frontend/autocomplete';
import Tabs from './frontend/tabs';

const Main = () => (
  <div className="Widgets">
    <Clock />
    <Weather/>
    <AutoComplete names="AJ Adan Adrian Alex Alison Alvin"/>
    <Tabs options='[{"title": "tab1", "content": "this is tab1"},{"title": "tab2", "content": "this is tab2"},{"title": "tab3", "content": "this is tab3"}]'/>
  </div>
);


export default Main;

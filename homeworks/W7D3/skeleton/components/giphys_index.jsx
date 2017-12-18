import React from 'react';

import GiphysIndexItem from './giphys_index_item';

export default ({giphys})=>(
  <ul>
  {giphys.map((giphy, idx) => (
    <li key={`img${idx}`}><img src={giphy.images.original.url}></img></li>))}
</ul>
);

import SongForm from './components/SongForm';
import ViewAllSongs from './components/ViewAllSongs';
import ViewAllSetLists from './components/ViewAllSetLists';
import ListForm from './components/ListForm';
import Main from './components/Main';
import Main2 from './components/Main2';
import {Routes,Route,Navigate} from 'react-router-dom'
import './App.css';

function App() {
  return (
    <div className="App">
    <Routes>
      <Route path='/' element={<Navigate to={'/setlists'} />} />
      <Route path='/setlists' element={<Main2/>} />
    </Routes>
    </div>
  );
}

export default App;

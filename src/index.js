import React from 'react';
import ReactDOM from 'react-dom';
import ReactTooltip from "react-tooltip";
import ReactModal from 'react-modal';
import Iframe from 'react-iframe'
import './index.css';

const axios = require('axios').default;

class ShowStrokes extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      showModal: false,
      kanji: '日本',
      data: []
    };
    this.handleOpenModal = this.handleOpenModal.bind(this);
    this.handleCloseModal = this.handleCloseModal.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.getURLs = this.getURLs.bind(this);
  }

  getURLs = () => {
    const kanji = this.state.kanji
    const req = axios.get('http://ec2-3-134-100-170.us-east-2.compute.amazonaws.com/api/strokes?chars=' + kanji)
    req.then(response => {
      const urls = response.data.map((item, i) => {
        return(item)
      })
      this.setState({data: urls})
    })
  }

  handleChange = (e) => {
   this.setState({
     kanji: e.target.value
   });
  }

  handleSubmit = (e) => {
   this.getURLs()
  }

  handleOpenModal = (modalURL) => {
   this.setState({
     showModal: true,
     modalURL: modalURL
   });
  }

  handleCloseModal = () => {
   this.setState({
     showModal: false
   });
  }

  render() {
    const list = this.state.data.map((item, i) => {
      return (
        <img src={item.url} />
      );
    });

    return (
      <div>
        <button className="bg-blue-500 hover:bg-blue-700 text-white py-2 px-4 rounded m-2" onClick={this.handleOpenModal}>Look up Stroke Order</button>
        <div>
          <ReactModal
             isOpen={this.state.showModal}
             style={{
               overlay: {
                 position: 'fixed',
                 top: 10,
                 left: 10,
                 right: 10,
                 bottom: 10,
                 backgroundColor: 'rgba(0, 0, 0, 0.5)'
               }
             }}
          >
            <div>
              <button className="bg-blue-500 hover:bg-blue-700 text-white py-2 px-4 rounded m-2" onClick={this.handleCloseModal}>Close</button>
            </div>
            <div className="p-4">
              <input className="shadow appearance-none border rounded w-1/6 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                     onChange={this.handleChange.bind(this)} type="text" name="kanji" placeholder="Enter one or more kanji here" />
              <button className="bg-blue-500 hover:bg-blue-700 text-white py-2 px-4 rounded m-2"
                      onClick={(e) => {e.stopPropagation(); this.handleSubmit()}}>Look Up Strokes</button>
              <div className="flex flex-row mt-4">
                {list}
              </div>
            </div>
          </ReactModal>
        </div>
      </div>
    );
  }
}

class KanjiCard extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isFlipped: false,
      isHidden: false
    };
  }

  sendData = (modalURL) => {
    this.props.handleOpenModal(modalURL);
  };

  render() {
    const dict_url = 'https://www.tanoshiijapanese.com/dictionary/kanji.cfm?k=' +
      this.props.data.wordj +
      '&search=Search+%3E'

    const stroke_order_url = 'https://kanji.sljfaq.org/kanjivg/memory.cgi?c=' +
      this.props.data.unicode

    const testedWord = (this.props.testType === 'Test Writing') ?
      this.props.data.hiragana :
      this.props.data.wordj

    if (this.state.isHidden) {
      return(null)
    }
    return (
      <div ref={ref => this.fooRef = ref} onClick={() => {ReactTooltip.hide(this.fooRef); this.setState({isFlipped: !this.state.isFlipped})}}
           className="card p-2 w-full md:w-1/2 lg:w-1/4 xl:w-1/6 text-center flex flex-col items-stretch cursor-pointer" style={{minHeight: 180}}>
        <span onClick={() => {
          this.setState({isHidden: !this.state.isHidden})
        }} className="hide-card cursor-pointer">
          <i className="fa fa-times"></i></span>
        {(!this.state.isFlipped && !this.props.isKanjiShown) ? (
          <div className="bg-gray-400 rounded-md p-2 py-4 text-center flex-grow flex items-center">
              <p className="text-2xl m-auto">{testedWord}</p>
          </div>
        ) : (
          <div className="bg-gray-400 rounded-md p-2 py-4 flex flex-col h-full">
            <div className="my-auto text-center">
              <p className="text-2xl">{this.props.data.wordj}</p>
              <p className="text-sm mt-2">{this.props.data.hiragana}</p>
	      <p className="text-sm mt-2">{this.props.data.definition}</p>
	      {(this.props.data.unicode === 'none') ? (
		<p></p>
	      ) : (
                <p className="flex flex-row justify-center my-2"><img src={stroke_order_url} width="100%"/></p>
              )}
              <p onClick={(e) => {e.stopPropagation(); this.sendData(dict_url)}} data-tip="Click to open dictionary" className="text-sm mt-2 text-blue-700 cursor-default">辞書</p>
            </div>
          </div>
        )}
        <ReactTooltip delayShow={2000}/>
      </div>
    )
  }
}

class KanjiTester extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      version: 'Kanji 2A,2B',
      testType: 'Test Writing',
      isKanjiShown: false,
      isDefShown: false,
      isFlipped: false,
      showModal: false,
      modalURL: 'none',
      data: []
    };
    this.handleOpenModal = this.handleOpenModal.bind(this);
    this.handleCloseModal = this.handleCloseModal.bind(this);
  }

  handleOpenModal = (modalURL) => {
   this.setState({
     showModal: true,
     modalURL: modalURL
   });
  }

  handleCloseModal = () => {
   this.setState({
     showModal: false
   });
  }

  getKanji = () => {
    const version = this.state.version
    const req = axios.get('http://ec2-3-134-100-170.us-east-2.compute.amazonaws.com/api/hello?version=' + version)
    req.then(response => {
      const cards = response.data.map((item, i) => {
        item.id += Date.now()
        return(item)
      })
      this.setState({data: cards})
    })
    this.setState({
      isKanjiShown: false,
      isDefShown: false,
    });
  }

  showKanji = () => {
    this.setState({
      isKanjiShown: !this.state.isKanjiShown,
    });
  }

  setVersion = (event) => {
    this.setState({version: event.target.value},
      this.getKanji)
  }

  setTestType = (event) => {
    this.setState({testType: event.target.value})
  }

  componentDidMount = () => {
    this.getKanji()
    document.title = "Kanji Tester"
  }


  render() {
    const list = this.state.data.map((item, i) => {
      return (
        <KanjiCard key={item.id} data={item} handleOpenModal={this.handleOpenModal}
                   testType={this.state.testType} isKanjiShown={this.state.isKanjiShown} isDefShown={this.state.isDefShown}/>
      );
    });

    return (
      <div>
        <div>
          <ShowStrokes />
        </div>
        <button className="bg-blue-500 hover:bg-blue-700 text-white py-2 px-4 rounded m-2 " onClick={this.getKanji}>Shuffle Cards</button>
        <button className="bg-blue-500 hover:bg-blue-700 text-white py-2 px-4 rounded m-2" onClick={this.showKanji}>Flip All</button>
        <select value={this.state.testType} onChange={this.setTestType}>
          <option>Test Writing</option>
          <option>Test Reading</option>
        </select>
        <select value={this.state.version} onChange={this.setVersion}>
	  <optgroup label="Chapter 2">
            <option value="Kanji 2A,2B">Kanji 2A,2B</option>
	  </optgroup>
          <optgroup label="&nbsp;&nbsp;&nbsp;&nbsp;Vocabulary">
	    <option value="Housing">&nbsp;&nbsp;&nbsp;&nbsp;Housing</option>
      <option value="FA">&nbsp;&nbsp;&nbsp;&nbsp;Furnishings and Appliances</option>
      <option value="HC">&nbsp;&nbsp;&nbsp;&nbsp;Household Chores</option>
      <option value="Verbs">&nbsp;&nbsp;&nbsp;&nbsp;Verbs</option>
	  </optgroup>
	  <optgroup label="Chapter 3">
            <option value="Kanji 3A,3B">Kanji 3A,3B</option>
	  </optgroup>
        </select>
        <div className="flex flex-wrap items-stretch">
          {list}
        </div>
        <div>
          <ReactModal
             isOpen={this.state.showModal}
             style={{
               overlay: {
                 position: 'fixed',
                 top: 10,
                 left: 10,
                 right: 10,
                 bottom: 10,
                 backgroundColor: 'rgba(0, 0, 0, 0.5)'
               }
             }}
          >
            <button className="bg-blue-500 hover:bg-blue-700 text-white py-2 px-4 rounded m-2" onClick={this.handleCloseModal}>Close</button>
            <Iframe url={this.state.modalURL}
                    height="100%"
                    width="100%"
                    position="relative"/>
          </ReactModal>
        </div>
      </div>
    );
  }
}

// ========================================

ReactDOM.render(
  <KanjiTester />,
  document.getElementById('root')
);

import './App.css';
import {useEffect, useState} from "react";

const baseurl = process.env.REACT_APP_API_BASE_URL

function App() {
  const [summary, setSummary] = useState({count: 0})
  const [err, setError] = useState(null)
  console.log(baseurl)

  useEffect(() => {
    const loadData = async () => {
      const response = await fetch(`${baseurl}/clients/summary`)
      const summary = await response.json()
      setSummary(summary)
    }
    loadData().catch((e) => {
      setError(e)
    })
  }, [])

  const hasError = !!err;
  return (
      <div className="App">
        <header className="App-header">
          <div>
            {hasError && "Error: " + err}
          </div>
          <div>
            {!hasError && summary && "We have " + summary.count + " clients now"}
          </div>
        </header>
      </div>
  );
}

export default App;

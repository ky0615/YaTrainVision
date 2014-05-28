process.stdin.resume()
process.stdin.setEncoding "utf8"
Text = new (require("./Text").Text)()

process.stdin.on 'data', (chunk)=>
	chunk.trim().split('\n').forEach (line)=>
		console.log  Text.get_destination_text 0, eval line
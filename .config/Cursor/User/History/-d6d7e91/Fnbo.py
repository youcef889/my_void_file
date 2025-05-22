from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/scan-folder')
def scan_folder():
    folder_path = "folder/toscan"  # Your folder path
    
    try:
        # Get all files in the directory
        files = os.listdir(folder_path)
        
        # Filter out directories, only keep files
        file_list = [f for f in files if os.path.isfile(os.path.join(folder_path, f))]
        
        return jsonify({
            "status": "success",
            "files": file_list
        })
    except Exception as e:
        return jsonify({
            "status": "error",
            "message": str(e)
        }), 500

if __name__ == '__main__':
    app.run(debug=True)
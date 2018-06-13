# Blank Google Cloud Function

Serverless is awesome! 
* Develop awesome Cloud Functions locally on your machine, 
* Deploy and test Functions locally (Uses the [emulator](https://github.com/GoogleCloudPlatform/cloud-functions-emulator))
* Build uploadable archives for deploying to Google Cloud.

## Quick Start

```bash
# Make sure you have the emulator installed (See #Installation)
git clone git@github.com:AnalyzePlatypus/Blank-Google-Cloud-Function.git
cd Blank-Google-Cloud-Function
npm install

npm run start-server # Start the dev server
npm run deploy-local # Deploy the function and call it once
```

## Development

### Installation

1. You will need to have `npm` installed.
2. Install any dependencies: `npm install`.
3. Install the Google Cloud Functions [offline emulator](https://github.com/GoogleCloudPlatform/cloud-functions-emulator).

### Usage

First, spin up the cloud emulator:

```bash
npm run start-server
```

Make your changes to `index.js`.

Use `npm install <package> --save` to install any dependencies you need (When you deploy to Google Cloud, your packages will be installed and managed for you on Google's infrastructure).

Deploy your function locally using: 

```bash
npm run deploy-local
```

This will deploy the function and call it once.

To call it again, run:

```bash
npm run call
```

To inspect the logs, run:

```bash
npm run view-logs
```

To spin down the server when you're finished:

```bash
npm run stop-server
```

For more control, interact with the emulator directly on the command line (see `functions --help`).

### Build

When you're ready to deploy to Google Cloud, build the upload archive with:

```bash
npm run build
```

A `tar.gz` archive will be generated into the project directory.

On the Google Cloud webapp:

1. Create a new function
2. Choose "Upload an Archive"
3. Upload the generated archive.
4. Set 'Function to execute' to `main`

## About the Files

* `index.js` is where all your logic goes.
* `package.json` is where you list your dependencies.

## Appendix

Deploying a function yourself:

```bash
functions deploy myFunction --trigger-http
```

You can then call it to see if it works:

```bash
functions call myFunction
```

For a rapid workflow, I like chaining both operations, so I can build and run my function with a single command:

```bash
functions deploy myFunction --trigger-http && functions call myFunction
```

This is what `npm run deploy-local` uses.


### A Note About Function Names

__Please note__: The emulator server is global - all your functions can see - and overwrite - other functions with the same name.
If you do not change this, your new function will replace any others deployed to the emulator with the same name.
This may not matter, as you can always redeploy the other functions from their own repos, and you probably don't want them piling up on disk anyway.

The default name for your function is `main`.
If you want to change it, changes must be made in:

* `index.js` - Change `exports.default = <newName> () {...}`
* `package.json` - Change the run scripts to point at the new name:
  * `deploy-local` should be `functions deploy <newName> --trigger-http && functions call <newName>`
  * `call` should be `functions call <newName>`
<h1>KeychainAccessSample<h1>
<h3>Steps</h3>
<p>Setting data in file ViewController.m [keychainAccess setValue:helpData forKey:@"help"];</p>
<ol>
     <li> Run the project. You will see your data in log</li>
     <li> Stop the app and delete the app from your device.</li>
     <li> Now comment [KeychainAccess setValue:helpData forKey:@"help"]; in file ViewController.m</li>
     <li> Run the app again. You will see your data in log again</li>
</ol>

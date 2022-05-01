// I know cringe name, but its important all traffic will come through here

import { HttpService } from '@rbxts/services';
import { LogToConsole } from './ErrorHandling';

// This is just a temporary server will change :)
let _baseUrl = 'http://server1.rovolution.me:3000/api/v1/roblox-api/';

interface IRequestOptions {
    path: string;

    // :Vomit: this is only here cause I haven't written the backend cause I am busy #MaterialGurl
    data: any;
}

export class HTTP_HANDLER {
    // Globals, super important this stay private
    public projectID: string;
    public apiKey: string;

    constructor(projectID: string, apiKey: string) {
        this.projectID = projectID;
        this.apiKey = apiKey;
    }

    private SendRequest({ path, data }: IRequestOptions) {
        // send object
        let send_object = {
            projectID: this.projectID,
            apiKey: this.apiKey,
            data,
        };

        let json_Serialised;
        try {
            // Serialise the JSON
            json_Serialised = HttpService.JSONEncode(send_object);
        } catch {
            // If it fails, log it
            LogToConsole({
                message: 'Failed to serialise JSON',
                debug: true,
            });
            return false;
        }

        // Ok JSON serialised, now send it
        let response = '';
        try {
            // Send the request
            response = HttpService.PostAsync(_baseUrl + path, json_Serialised);
        } catch (e) {
            // More logging cause yay
            LogToConsole({
                message: 'Failed to Post an Async req',
                debug: true,
            });
            return false;
        }

        // Now decode the response
        let returned_json_Decoded;
        try {
            // Serialise the JSON
            returned_json_Decoded = HttpService.JSONDecode(response);
        } catch {
            // If it fails, log it
            LogToConsole({
                message: 'Failed to decode returned JSON',
                debug: true,
            });
            return false;
        }

        return returned_json_Decoded;
    }

    public SendToApi({ path, data }: IRequestOptions) {
        let Result = this.SendRequest({ path, data });

        if (Result === false) {
            LogToConsole({
                message: 'Failed to send request to API',
                debug: false,
            });
            return false;
        }

        return Result;
    }
}

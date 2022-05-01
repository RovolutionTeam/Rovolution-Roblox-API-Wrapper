// Cause of the way we are handling state a Class based approach seems to be the best way to go.

import { LogToConsole, SetDebugger } from 'utils/ErrorHandling';
import { HTTP_HANDLER } from 'utils/Https';

SetDebugger(true);

export default class Rovolution_API extends HTTP_HANDLER {
    // Set global
    constructor(projectID: string, apiKey: string) {
        super(projectID, apiKey);
        this.VerifyKey();
    }

    private VerifyKey() {
        if (this.apiKey === '') {
            LogToConsole({
                message: 'API Key is not given!',
            });
        }
        if (this.projectID === '') {
            LogToConsole({
                message: 'Project Key is not given!',
            });
        }

        // No data needed
        let test = this.SendToApi({
            path: 'checkKey',
            data: {},
        });
    }

    // Group methods

    ExileUser(groupID: number, userID: number) {
        return this.SendToApi({
            path: 'exileUser',
            data: {
                groupID,
                userID,
            },
        });
    }

    SetRank(groupID: number, userID: number, rank: number) {
        return this.SendToApi({
            path: 'setRank',
            data: {
                groupID,
                userID,
                rank,
            },
        });
    }

    PromoteUser(groupID: number, userID: number) {
        print(this);
        return this.SendToApi({
            path: 'promoteUser',
            data: {
                groupID,
                userID,
            },
        });
    }

    DemoteUser(groupID: number, userID: number) {
        return this.SendToApi({
            path: 'demoteUser',
            data: {
                groupID,
                userID,
            },
        });
    }

    AcceptJoinRequest(groupID: number, userID: number) {
        return this.SendToApi({
            path: 'acceptJoinRequest',
            data: {
                groupID,
                userID,
            },
        });
    }

    RejectJoinRequest(groupID: number, userID: number) {
        return this.SendToApi({
            path: 'rejectJoinRequest',
            data: {
                groupID,
                userID,
            },
        });
    }
}

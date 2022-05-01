let _Debugging: Boolean = false;

export function SetDebugger(state: Boolean) {
    _Debugging = state;
}

export function LogToConsole({ message, debug }: { message: string; debug?: boolean }) {
    if (debug && !_Debugging) return;
    if (debug && _Debugging) {
        warn(':: Rovolution Roblox API Debug :: ' + message);
        return;
    }
    error(':: Rovolution Roblox API :: ' + message);
}

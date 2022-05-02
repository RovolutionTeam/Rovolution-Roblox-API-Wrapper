-- Example using the Rovolution API --
local Rovolution_Module = require(9520664531).default -- Default because of the way the wrapper is written

local ProjectID = "TEST_PROJECT_ID"
local API_KEY = "TEST_API_KEY"

local API = Rovolution_Module.new(ProjectID, API_KEY)

-- Now we can talk to the API

-- For example promote a user
local groupID = 7535264 -- Rovolution Group
local userID = 3152860974 -- A test account

API:PromoteUser(groupID, userID)

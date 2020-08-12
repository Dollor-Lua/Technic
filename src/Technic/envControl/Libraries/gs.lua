local services = {"Workspace", "Players", "CoreGui", "CorePackages", "Lighting", 
	"PluginGuiService", "ReplicatedFirst", "ReplicatedScriptService", "ReplicatedStorage",
	"RobloxPluginGuiService", "ServerScriptService", "ServerStorage", "StarterGui",
	"StarterPack", "StarterPlayer", "SoundService", "Chat", "LocalizationService",
	"TestService", "AdService", "AppStorageService", "ABTestService", "AnalyticsService",
	"AssetManager", "AssetManagerService", "BadgeService", "BrowserService",
	"BulkImportService", "CollectionService", "ContentProviderService",
	"CacheableContentProvider", "ChangeHistoryService", "ClusterPacketCache", 
	"ContextActionService", "ControllerService", "CookiesService", "CorePackages",
	"CoreScriptSyncService", "CSGDictonaryService", "Debris", "DataStoreService",
	"DebugSettings", "DraftsService", "EventIngestService", "FlagStandService",
	"FlyweightService", "FriendService", "GamepadService", "GamePassService", "GameSettings",
	"Geometry", "GoogleAnalyticsConfiguration", "GroupService", "GuidRegistryService",
	"GuiService", "HapticService", "HttpRbxApiService", "HttpService", "InsertService",
	"InternalContainer", "KeyboardService", "KeyframeSequenceProvider", "LanguageService",
	"LocalStorageService", "LoginService", "LogService", "LuaSettings", "LuaWebService",
	"MarketplaceService", "MemStorageService", "MeshContentProvider", "MessagingService",
	"MouseService", "NetworkClient", "NetworkServer", "NetworkSettings",
	"NonReplicatedCSGDictionaryService", "NotificationService", "PackageService",
	"PathfindingService", "PermissionsService", "PhysicsService", "PhysicsSettings",
	"PlayerEmulatorService", "PluginDebugService", "PolicyService", "RunService",
	"RbxAnalyticsService", "RenderSettings", "RobloxReplicatedStorage", "RuntimeScriptService",
	"ScriptContext", "ScriptService", "Selection", "SessionService", "SocialService",
	"SolidModelContentProvider", "SpawnerService", "Stats", "StopWatchReporter",
	"Studio", "StudioData", "StudioService", "TweenService", "TaskScheduler", "Teams",
	"TeleportService", "TextService", "ThirdPartyUserService", "TimerService", "UserService",
	"UGCValidationService", "UserGameSettings", "UserInputService", "UserStorageService",
	"VersionControlService", "VirtualInputManager", "VirtualUser", "Visit", "VRService",
}

local gs = function(str)
	local isServ = false
	for i,v in pairs(services) do
		if v:lower()==str:lower() then
			return game:GetService(v)
		end
		if i%100==0 then
			wait()
		end
	end
end

return gs

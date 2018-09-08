{-# LANGUAGE OverloadedStrings #-}
-- |
-- Module: NetSpider.Spider.Config
-- Description: Configuration of Spider
-- Maintainer: Toshio Ito <debug.ito@gmail.com>
--
-- 
module NetSpider.Spider.Config
       ( Spider(..),
         Config(..),
         defConfig,
         Host,
         Port
       ) where

import Data.Greskell (Key)
import Network.Greskell.WebSocket (Host, Port)

import qualified Network.Greskell.WebSocket as Gr

import NetSpider.Graph (VNode)

-- | An IO agent of the NetSpider database.
--
-- - Type @n@: node ID. Note that type of node ID has nothing to do
--   with type of vertex ID used by Gremlin implementation. Node ID
--   (in net-spider) is stored as a vertex property. See 'nodeIdKey'
--   config field.
-- - Type @na@: node attributes. It should implement
--   'NetSpider.Graph.NodeAttributes' class. You can set this to @()@
--   if you don't need node attributes.
-- - Type @fla@: attributes of found links. It should implement
--   'NetSpider.Graph.LinkAttributes' class. You can set this to @()@
--   if you don't need link attributes.
data Spider n na fla =
  Spider
  { spiderConfig :: Config n na fla,
    spiderClient :: Gr.Client
  }

-- | Configuration to create a 'Spider' object.
data Config n na fla =
  Config
  { wsHost :: Gr.Host,
    -- ^ Host of WebSocket endpoint of Tinkerpop Gremlin
    -- Server. Default: \"localhost\".
    wsPort :: Gr.Port,
    -- ^ Port of WebSocket endpoint of Tinkerpop Gremlin
    -- Server. Default: 8182
    nodeIdKey :: Key VNode n
    -- ^ Name of vertex property that stores the node ID. Default:
    -- \"@node_id\".
  }

defConfig :: Eq n => Config n na fla
defConfig =
  Config
  { wsHost = "localhost",
    wsPort = 8182,
    nodeIdKey = "@node_id"
  }


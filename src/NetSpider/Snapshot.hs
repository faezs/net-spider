-- |
-- Module: NetSpider.Snapshot
-- Description: Types about snapshot graph
-- Maintainer: Toshio Ito <debug.ito@gmail.com>
--
-- 
module NetSpider.Snapshot
       ( -- * SnapshotNode
         SnapshotNode,
         nodeId,
         -- * SnapshotLink
         SnapshotLink,
         sourceNode,
         sourcePort,
         destinationNode,
         destinationPort,
         isDirected,
         linkTimestamp,
         -- * SnapshotElement
         SnapshotElement
       ) where

import NetSpider.Snapshot.Internal
  ( SnapshotNode(..),
    SnapshotLink(..),
    SnapshotElement
  )
import NetSpider.Timestamp (Timestamp)


nodeId :: SnapshotNode n -> n
nodeId = _nodeId

sourceNode :: SnapshotLink n p -> n
sourceNode = _sourceNode

sourcePort :: SnapshotLink n p -> p
sourcePort = _sourcePort

destinationNode :: SnapshotLink n p -> n
destinationNode = _destinationNode

destinationPort :: SnapshotLink n p -> p
destinationPort = _destinationPort

isDirected :: SnapshotLink n p -> Bool
isDirected = _isDirected

linkTimestamp :: SnapshotLink n p -> Timestamp
linkTimestamp = _linkTimestamp
function onMoveItem(cid, item, formPosition, toPosition, fromItem, toItem, fromGround, toGround)
    if item.itemid == 2159 then
            doPlayerSendCancel(cid,"you can't throw this item on ground.")
            return false
    end
end
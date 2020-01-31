delete = table.delete().where(table.post_id == post_id).execute()

delete = table.delete().where(table.post_id == post_id)
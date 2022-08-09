class SecretDiary
    def initialize(diary) # diary is an instance of Diary
      @diary = diary
      @is_locked = false
    end
  
    def read
      # Raises the error "Go away!" if the diary is locked
      # Returns the diary's contents if the diary is unlocked
      # The diary starts off locked
      fail "Go away!" if @is_locked
      @diary.read
    end
  
    def lock
      # Locks the diary
      # Returns nothing
      @is_locked = true
    end
  
    def unlock
      # Unlocks the diary
      # Returns nothing
      @is_locked = false
    end
  end
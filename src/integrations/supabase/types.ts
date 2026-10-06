export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "14.18"
  }
  public: {
    Tables: {
      achievements: {
        Row: {
          code: string
          coin_reward: number
          description: string
          icon: string
          metric: string
          target: number
          title: string
          xp_reward: number
        }
        Insert: {
          code: string
          coin_reward: number
          description: string
          icon: string
          metric: string
          target: number
          title: string
          xp_reward: number
        }
        Update: {
          code?: string
          coin_reward?: number
          description?: string
          icon?: string
          metric?: string
          target?: number
          title?: string
          xp_reward?: number
        }
        Relationships: []
      }
      challenges: {
        Row: {
          base_a: number
          base_b: number
          challenger: string
          created_at: string
          ends_at: string | null
          id: string
          metric: string
          opponent: string
          score_a: number
          score_b: number
          status: string
          winner: string | null
        }
        Insert: {
          base_a?: number
          base_b?: number
          challenger: string
          created_at?: string
          ends_at?: string | null
          id?: string
          metric: string
          opponent: string
          score_a?: number
          score_b?: number
          status?: string
          winner?: string | null
        }
        Update: {
          base_a?: number
          base_b?: number
          challenger?: string
          created_at?: string
          ends_at?: string | null
          id?: string
          metric?: string
          opponent?: string
          score_a?: number
          score_b?: number
          status?: string
          winner?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "challenges_challenger_fkey"
            columns: ["challenger"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "challenges_opponent_fkey"
            columns: ["opponent"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      cheat_flags: {
        Row: {
          created_at: string
          id: number
          reason: string
          user_id: string | null
        }
        Insert: {
          created_at?: string
          id?: number
          reason: string
          user_id?: string | null
        }
        Update: {
          created_at?: string
          id?: number
          reason?: string
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "cheat_flags_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      coin_ledger: {
        Row: {
          coin_delta: number
          created_at: string
          id: number
          reason: string
          user_id: string
          xp_delta: number
        }
        Insert: {
          coin_delta?: number
          created_at?: string
          id?: number
          reason: string
          user_id: string
          xp_delta?: number
        }
        Update: {
          coin_delta?: number
          created_at?: string
          id?: number
          reason?: string
          user_id?: string
          xp_delta?: number
        }
        Relationships: [
          {
            foreignKeyName: "coin_ledger_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      discoveries: {
        Row: {
          created_at: string
          id: string
          location_id: string
          user_id: string
        }
        Insert: {
          created_at?: string
          id?: string
          location_id: string
          user_id: string
        }
        Update: {
          created_at?: string
          id?: string
          location_id?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "discoveries_location_id_fkey"
            columns: ["location_id"]
            isOneToOne: false
            referencedRelation: "locations"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "discoveries_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      event_checkins: {
        Row: {
          created_at: string
          event_id: string
          user_id: string
        }
        Insert: {
          created_at?: string
          event_id: string
          user_id: string
        }
        Update: {
          created_at?: string
          event_id?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "event_checkins_event_id_fkey"
            columns: ["event_id"]
            isOneToOne: false
            referencedRelation: "events"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "event_checkins_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      events: {
        Row: {
          active: boolean
          city: string
          coin_reward: number
          created_at: string
          description: string
          ends_at: string
          id: string
          lat: number
          lng: number
          radius_m: number
          sponsor: string | null
          starts_at: string
          title: string
          xp_reward: number
        }
        Insert: {
          active?: boolean
          city?: string
          coin_reward?: number
          created_at?: string
          description?: string
          ends_at: string
          id?: string
          lat: number
          lng: number
          radius_m?: number
          sponsor?: string | null
          starts_at?: string
          title: string
          xp_reward?: number
        }
        Update: {
          active?: boolean
          city?: string
          coin_reward?: number
          created_at?: string
          description?: string
          ends_at?: string
          id?: string
          lat?: number
          lng?: number
          radius_m?: number
          sponsor?: string | null
          starts_at?: string
          title?: string
          xp_reward?: number
        }
        Relationships: []
      }
      friendships: {
        Row: {
          addressee: string
          created_at: string
          id: string
          requester: string
          status: string
        }
        Insert: {
          addressee: string
          created_at?: string
          id?: string
          requester: string
          status?: string
        }
        Update: {
          addressee?: string
          created_at?: string
          id?: string
          requester?: string
          status?: string
        }
        Relationships: [
          {
            foreignKeyName: "friendships_addressee_fkey"
            columns: ["addressee"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "friendships_requester_fkey"
            columns: ["requester"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      game_config: {
        Row: {
          key: string
          label: string
          value: number
        }
        Insert: {
          key: string
          label?: string
          value: number
        }
        Update: {
          key?: string
          label?: string
          value?: number
        }
        Relationships: []
      }
      inventory: {
        Row: {
          created_at: string
          item_id: string
          user_id: string
        }
        Insert: {
          created_at?: string
          item_id: string
          user_id: string
        }
        Update: {
          created_at?: string
          item_id?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "inventory_item_id_fkey"
            columns: ["item_id"]
            isOneToOne: false
            referencedRelation: "shop_items"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "inventory_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      locations: {
        Row: {
          active: boolean
          category: string
          city: string
          coin_reward: number
          created_at: string
          description: string
          id: string
          is_demo: boolean
          lat: number
          lng: number
          name: string
          radius_m: number
          rarity: string
          xp_reward: number
        }
        Insert: {
          active?: boolean
          category?: string
          city?: string
          coin_reward?: number
          created_at?: string
          description?: string
          id?: string
          is_demo?: boolean
          lat: number
          lng: number
          name: string
          radius_m?: number
          rarity?: string
          xp_reward?: number
        }
        Update: {
          active?: boolean
          category?: string
          city?: string
          coin_reward?: number
          created_at?: string
          description?: string
          id?: string
          is_demo?: boolean
          lat?: number
          lng?: number
          name?: string
          radius_m?: number
          rarity?: string
          xp_reward?: number
        }
        Relationships: []
      }
      missions: {
        Row: {
          active: boolean
          coin_reward: number
          description: string
          id: string
          metric: string
          period: string
          target: number
          title: string
          xp_reward: number
        }
        Insert: {
          active?: boolean
          coin_reward: number
          description: string
          id?: string
          metric: string
          period: string
          target: number
          title: string
          xp_reward: number
        }
        Update: {
          active?: boolean
          coin_reward?: number
          description?: string
          id?: string
          metric?: string
          period?: string
          target?: number
          title?: string
          xp_reward?: number
        }
        Relationships: []
      }
      notifications: {
        Row: {
          body: string
          created_at: string
          id: string
          read: boolean
          title: string
          user_id: string | null
        }
        Insert: {
          body?: string
          created_at?: string
          id?: string
          read?: boolean
          title: string
          user_id?: string | null
        }
        Update: {
          body?: string
          created_at?: string
          id?: string
          read?: boolean
          title?: string
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "notifications_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      parcels: {
        Row: {
          cell_id: string
          claimed_at: string
          last_collected_at: string
          lat: number
          level: number
          lng: number
          owner_id: string
        }
        Insert: {
          cell_id: string
          claimed_at?: string
          last_collected_at?: string
          lat: number
          level?: number
          lng: number
          owner_id: string
        }
        Update: {
          cell_id?: string
          claimed_at?: string
          last_collected_at?: string
          lat?: number
          level?: number
          lng?: number
          owner_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "parcels_owner_id_fkey"
            columns: ["owner_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      player_achievements: {
        Row: {
          code: string
          unlocked_at: string
          user_id: string
        }
        Insert: {
          code: string
          unlocked_at?: string
          user_id: string
        }
        Update: {
          code?: string
          unlocked_at?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "player_achievements_code_fkey"
            columns: ["code"]
            isOneToOne: false
            referencedRelation: "achievements"
            referencedColumns: ["code"]
          },
          {
            foreignKeyName: "player_achievements_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      player_missions: {
        Row: {
          claimed: boolean
          id: string
          mission_id: string
          period_key: string
          progress: number
          user_id: string
        }
        Insert: {
          claimed?: boolean
          id?: string
          mission_id: string
          period_key: string
          progress?: number
          user_id: string
        }
        Update: {
          claimed?: boolean
          id?: string
          mission_id?: string
          period_key?: string
          progress?: number
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "player_missions_mission_id_fkey"
            columns: ["mission_id"]
            isOneToOne: false
            referencedRelation: "missions"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "player_missions_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      profiles: {
        Row: {
          avatar_emoji: string
          coins: number
          created_at: string
          discoveries_count: number
          id: string
          invited_by: string | null
          last_action_at: string | null
          last_daily: string | null
          last_lat: number | null
          last_lng: number | null
          level: number
          onboarded: boolean
          parcels_count: number
          player_id: string
          show_on_leaderboard: boolean
          streak: number
          title: string | null
          username: string
          xp: number
        }
        Insert: {
          avatar_emoji?: string
          coins?: number
          created_at?: string
          discoveries_count?: number
          id: string
          invited_by?: string | null
          last_action_at?: string | null
          last_daily?: string | null
          last_lat?: number | null
          last_lng?: number | null
          level?: number
          onboarded?: boolean
          parcels_count?: number
          player_id: string
          show_on_leaderboard?: boolean
          streak?: number
          title?: string | null
          username: string
          xp?: number
        }
        Update: {
          avatar_emoji?: string
          coins?: number
          created_at?: string
          discoveries_count?: number
          id?: string
          invited_by?: string | null
          last_action_at?: string | null
          last_daily?: string | null
          last_lat?: number | null
          last_lng?: number | null
          level?: number
          onboarded?: boolean
          parcels_count?: number
          player_id?: string
          show_on_leaderboard?: boolean
          streak?: number
          title?: string | null
          username?: string
          xp?: number
        }
        Relationships: [
          {
            foreignKeyName: "profiles_invited_by_fkey"
            columns: ["invited_by"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      qr_codes: {
        Row: {
          active: boolean
          code: string
          coin_reward: number
          created_at: string
          id: string
          label: string
          max_uses: number
          uses: number
          xp_reward: number
        }
        Insert: {
          active?: boolean
          code: string
          coin_reward?: number
          created_at?: string
          id?: string
          label: string
          max_uses?: number
          uses?: number
          xp_reward?: number
        }
        Update: {
          active?: boolean
          code?: string
          coin_reward?: number
          created_at?: string
          id?: string
          label?: string
          max_uses?: number
          uses?: number
          xp_reward?: number
        }
        Relationships: []
      }
      qr_redemptions: {
        Row: {
          code_id: string
          created_at: string
          user_id: string
        }
        Insert: {
          code_id: string
          created_at?: string
          user_id: string
        }
        Update: {
          code_id?: string
          created_at?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "qr_redemptions_code_id_fkey"
            columns: ["code_id"]
            isOneToOne: false
            referencedRelation: "qr_codes"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "qr_redemptions_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      shop_items: {
        Row: {
          active: boolean
          id: string
          kind: string
          name: string
          price: number
          sort: number
          value: string
        }
        Insert: {
          active?: boolean
          id?: string
          kind: string
          name: string
          price: number
          sort?: number
          value: string
        }
        Update: {
          active?: boolean
          id?: string
          kind?: string
          name?: string
          price?: number
          sort?: number
          value?: string
        }
        Relationships: []
      }
      team_members: {
        Row: {
          joined_at: string
          team_id: string
          user_id: string
        }
        Insert: {
          joined_at?: string
          team_id: string
          user_id: string
        }
        Update: {
          joined_at?: string
          team_id?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "team_members_team_id_fkey"
            columns: ["team_id"]
            isOneToOne: false
            referencedRelation: "teams"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "team_members_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: true
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      teams: {
        Row: {
          created_at: string
          emoji: string
          id: string
          name: string
          owner_id: string
        }
        Insert: {
          created_at?: string
          emoji?: string
          id?: string
          name: string
          owner_id: string
        }
        Update: {
          created_at?: string
          emoji?: string
          id?: string
          name?: string
          owner_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "teams_owner_id_fkey"
            columns: ["owner_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      user_roles: {
        Row: {
          id: string
          role: Database["public"]["Enums"]["app_role"]
          user_id: string
        }
        Insert: {
          id?: string
          role: Database["public"]["Enums"]["app_role"]
          user_id: string
        }
        Update: {
          id?: string
          role?: Database["public"]["Enums"]["app_role"]
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_roles_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      _are_friends: { Args: { a: string; b: string }; Returns: boolean }
      _award: {
        Args: {
          p_coins: number
          p_reason: string
          p_user: string
          p_xp: number
        }
        Returns: undefined
      }
      _check_speed: {
        Args: { p_lat: number; p_lng: number; p_user: string }
        Returns: undefined
      }
      _find_player: { Args: { p_q: string }; Returns: string }
      _metric_count: {
        Args: { p_metric: string; p_user: string }
        Returns: number
      }
      _notify: {
        Args: { p_body: string; p_title: string; p_user: string }
        Returns: undefined
      }
      _progress: {
        Args: { p_amount: number; p_metric: string; p_user: string }
        Returns: undefined
      }
      _require_admin: { Args: { p_user: string }; Returns: undefined }
      admin_broadcast: {
        Args: { p_body: string; p_title: string; p_user: string }
        Returns: Json
      }
      admin_event_save: { Args: { p: Json; p_user: string }; Returns: Json }
      admin_qr_create: {
        Args: {
          p_code: string
          p_coins: number
          p_label: string
          p_max: number
          p_user: string
          p_xp: number
        }
        Returns: Json
      }
      admin_stats: { Args: { p_user: string }; Returns: Json }
      admin_toggle: {
        Args: {
          p_active: boolean
          p_id: string
          p_table: string
          p_user: string
        }
        Returns: Json
      }
      cfg: { Args: { p_key: string }; Returns: number }
      game_claim: {
        Args: { p_cell: string; p_lat: number; p_lng: number; p_user: string }
        Returns: Json
      }
      game_claim_mission: {
        Args: { p_player_mission: string; p_user: string }
        Returns: Json
      }
      game_collect: { Args: { p_user: string }; Returns: Json }
      game_daily: { Args: { p_user: string }; Returns: Json }
      game_discover: {
        Args: {
          p_lat: number
          p_lng: number
          p_location: string
          p_user: string
        }
        Returns: Json
      }
      has_role: {
        Args: {
          _role: Database["public"]["Enums"]["app_role"]
          _user_id: string
        }
        Returns: boolean
      }
      haversine_m: {
        Args: { lat1: number; lat2: number; lng1: number; lng2: number }
        Returns: number
      }
      level_for_xp: { Args: { p_xp: number }; Returns: number }
      live_discover_guard: { Args: { p_user: string }; Returns: undefined }
      live_event_checkin: {
        Args: { p_event: string; p_lat: number; p_lng: number; p_user: string }
        Returns: Json
      }
      live_qr_redeem: {
        Args: { p_code: string; p_user: string }
        Returns: Json
      }
      notif_read_all: { Args: { p_user: string }; Returns: Json }
      shop_buy: { Args: { p_item: string; p_user: string }; Returns: Json }
      shop_equip: { Args: { p_item: string; p_user: string }; Returns: Json }
      social_challenge_create: {
        Args: { p_friend: string; p_metric: string; p_user: string }
        Returns: Json
      }
      social_challenge_respond: {
        Args: { p_accept: boolean; p_id: string; p_user: string }
        Returns: Json
      }
      social_challenge_sync: { Args: { p_user: string }; Returns: Json }
      social_friend_request: {
        Args: { p_query: string; p_user: string }
        Returns: Json
      }
      social_friend_respond: {
        Args: { p_accept: boolean; p_id: string; p_user: string }
        Returns: Json
      }
      social_redeem_invite: {
        Args: { p_code: string; p_user: string }
        Returns: Json
      }
      social_team_create: {
        Args: { p_emoji: string; p_name: string; p_user: string }
        Returns: Json
      }
      social_team_join: {
        Args: { p_team: string; p_user: string }
        Returns: Json
      }
      social_team_leave: { Args: { p_user: string }; Returns: Json }
    }
    Enums: {
      app_role: "admin" | "founder" | "user"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends (DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never) = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends (PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never) = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {
      app_role: ["admin", "founder", "user"],
    },
  },
} as const

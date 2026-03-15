import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

export type Database = {
  public: {
    Tables: {
      grade_boundaries: {
        Row: {
          id: number
          subject: string
          level: string
          year: number
          grade7: number
          grade6: number
          grade5: number
          grade4: number
          grade3: number
          grade2: number
          max_total: number
          created_at: string
        }
      }
    }
  }
}

import { NextResponse } from 'next/server'
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export async function GET() {
  try {
    const supabase = createClient(supabaseUrl, supabaseAnonKey)
    const { data, error } = await supabase
      .from('visitor_count')
      .select('count')
      .eq('id', 1)
      .single()

    if (error) {
      console.error('visitor_count GET error:', error)
      return NextResponse.json({ page_views: 0 }, { status: 200 })
    }
    const count = Number(data?.count ?? 0)
    return NextResponse.json({ page_views: count })
  } catch (e) {
    console.error(e)
    return NextResponse.json({ page_views: 0 }, { status: 200 })
  }
}

export async function POST() {
  try {
    const supabase = createClient(supabaseUrl, supabaseAnonKey)

    const { data } = await supabase
      .from('visitor_count')
      .select('count')
      .eq('id', 1)
      .single()

    const currentCount = Number(data?.count ?? 0)
    const nextCount = currentCount + 1

    await supabase
      .from('visitor_count')
      .update({ count: nextCount })
      .eq('id', 1)

    return NextResponse.json({ page_views: nextCount })
  } catch (e) {
    console.error(e)
    return NextResponse.json({ page_views: 0 }, { status: 200 })
  }
}

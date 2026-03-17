import { NextResponse } from 'next/server'
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export async function GET() {
  try {
    const supabase = createClient(supabaseUrl, supabaseAnonKey)
    const { data, error } = await supabase
      .from('page_views')
      .select('page_views')
      .eq('id', 1)
      .single()

    if (error) {
      console.error('page_views GET error:', error)
      return NextResponse.json({ page_views: 0 }, { status: 200 })
    }
    return NextResponse.json({ page_views: Number(data?.page_views ?? 0) })
  } catch (e) {
    console.error(e)
    return NextResponse.json({ page_views: 0 }, { status: 200 })
  }
}

export async function POST() {
  try {
    const supabase = createClient(supabaseUrl, supabaseAnonKey)
    const { data: row, error: selectError } = await supabase
      .from('page_views')
      .select('page_views')
      .eq('id', 1)
      .single()

    if (selectError) {
      console.error('page_views POST select error:', selectError)
      return NextResponse.json({ page_views: 0 }, { status: 200 })
    }

    const nextPageViews = Number(row?.page_views ?? 0) + 1
    const { error: updateError } = await supabase
      .from('page_views')
      .update({ page_views: nextPageViews })
      .eq('id', 1)

    if (updateError) {
      console.error('page_views POST update error:', updateError)
      return NextResponse.json({ page_views: Number(row?.page_views ?? 0) }, { status: 200 })
    }
    return NextResponse.json({ page_views: nextPageViews })
  } catch (e) {
    console.error(e)
    return NextResponse.json({ page_views: 0 }, { status: 200 })
  }
}

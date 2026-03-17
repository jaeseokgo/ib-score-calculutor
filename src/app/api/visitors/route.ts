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
      return NextResponse.json({ count: 0 }, { status: 200 })
    }
    return NextResponse.json({ count: Number(data?.count ?? 0) })
  } catch (e) {
    console.error(e)
    return NextResponse.json({ count: 0 }, { status: 200 })
  }
}

export async function POST() {
  try {
    const supabase = createClient(supabaseUrl, supabaseAnonKey)
    const { data: row, error: selectError } = await supabase
      .from('visitor_count')
      .select('count')
      .eq('id', 1)
      .single()

    if (selectError) {
      console.error('visitor_count POST select error:', selectError)
      return NextResponse.json({ count: 0 }, { status: 200 })
    }

    const nextCount = Number(row?.count ?? 0) + 1
    const { error: updateError } = await supabase
      .from('visitor_count')
      .update({ count: nextCount })
      .eq('id', 1)

    if (updateError) {
      console.error('visitor_count POST update error:', updateError)
      return NextResponse.json({ count: Number(row?.count ?? 0) }, { status: 200 })
    }
    return NextResponse.json({ count: nextCount })
  } catch (e) {
    console.error(e)
    return NextResponse.json({ count: 0 }, { status: 200 })
  }
}
